//
// Created by deric kramer on 10/2/22.
// Copyright (c) 2022 SingletonConsulting. All rights reserved.
//

import CoreData
import Foundation

open class CoreDataManager {
    typealias CoreDataManagerCompletion = () -> ()

    private let modelName: String
    private let completion: CoreDataManagerCompletion

    init(modelName: String = "DataModel", completion: @escaping CoreDataManagerCompletion) {
        self.modelName = modelName
        self.completion = completion

        setupCoreDataStack()
    }

    // MARK: - Core Data Stack
    open private(set) lazy var mainManagedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.parent = self.privateManagedObjectContext
        return managedObjectContext
    }()

    private lazy var privateManagedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        return managedObjectContext
    }()

    private lazy var managedObjectModel: NSManagedObjectModel? = {
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            return nil
        }
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        return managedObjectModel
    }()

    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        guard let managedObjectModel = self.managedObjectModel else {
            return nil
        }
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        return persistentStoreCoordinator
    }()

    // MARK: - Computed Properties
    private var persistentStoreURL: URL {
        // Helpers
        let storeName = "\(modelName).sqlite"
        let fileManager = FileManager.default

        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]

        return documentsDirectoryURL.appendingPathComponent(storeName)
    }

    // MARK: - Helper Methods
    open func saveChanges() {
        mainManagedObjectContext.performAndWait({
            do {
                if self.mainManagedObjectContext.hasChanges {
                    try self.mainManagedObjectContext.save()
                }
            } catch {
                let saveError = error as NSError
                print("Unable to Save Changes of Main Managed Object Context")
                print("\(saveError), \(saveError.localizedDescription)")
            }
        })

        privateManagedObjectContext.perform({
            do {
                if self.privateManagedObjectContext.hasChanges {
                    try self.privateManagedObjectContext.save()
                }
            } catch {
                let saveError = error as NSError
                print("Unable to Save Changes of Private Managed Object Context")
                print("\(saveError), \(saveError.localizedDescription)")
            }
        })
    }

    open func privateChildManagedObjectContext() -> NSManagedObjectContext {
        // Initialize Managed Object Context
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)

        // Configure Managed Object Context
        managedObjectContext.parent = mainManagedObjectContext

        return managedObjectContext
    }

    // MARK: - Private Helper Methods
    private func setupCoreDataStack() {
        // Fetch Persistent Store Coordinator
        let _ = mainManagedObjectContext.persistentStoreCoordinator

        DispatchQueue.global().async {
            // Add Persistent Store
            self.addPersistentStore()

            // Invoke Completion On Main Queue
            DispatchQueue.main.async { self.completion() }
        }
    }

    private func addPersistentStore() {
        guard let persistentStoreCoordinator = persistentStoreCoordinator else { fatalError("Unable to Initialize Persistent Store Coordinator") }

        // Helper
        let persistentStoreURL = self.persistentStoreURL

        do {
            let options = [ NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true ]
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreURL, options: options)

        } catch {
            let addPersistentStoreError = error as NSError

            print("Unable to Add Persistent Store")
            print("\(addPersistentStoreError.localizedDescription)")
        }
    }

}