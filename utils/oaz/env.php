<?php
return [
    'cache' => [
        'frontend' => [
            'default' => [
                'backend' => '\\Magento\\Framework\\Cache\\Backend\\RemoteSynchronizedCache',
                'backend_options' => [
                    'remote_backend' => '\\Magento\\Framework\\Cache\\Backend\\Redis',
                    'remote_backend_options' => [
                        'server' => 'redis',
                        'port' => '6379',
                        'database' => 1,
                        'persistent' => 0,
                        'password' => '',
                        'compress_data' => '1'
                    ],
                    'local_backend' => 'Cm_Cache_Backend_File',
                    'local_backend_options' => [
                        'cache_dir' => '/dev/shm/'
                    ]
                ],
                'frontend_options' => [
                    'write_control' => false
                ]
            ]
        ],
        'type' => [
            'default' => [
                'frontend' => 'default'
            ]
        ],
        'graphql' => [
            'id_salt' => 'xIxvyTifMMaoOTUfzJqdWosG9tpmYHtI'
        ]
    ],
    'MAGE_MODE' => 'developer',
    'cron' => [
        'enabled' => 0
    ],
    'backend' => [
        'frontName' => 'admin'
    ],
    'remote_storage' => [
        'driver' => 'file'
    ],
    'queue' => [
        'amqp' => [
            'host' => 'rabbitmq',
            'port' => '5672',
            'user' => 'guest',
            'password' => 'guest',
            'virtualhost' => '/'
        ],
        'consumers_wait_for_messages' => 0
    ],
    'crypt' => [
        'key' => '39093d8d676daaf2c49c99c9034d7a1b'
    ],
    'db' => [
        'connection' => [
            'default' => [
                'host' => 'db',
                'username' => 'root',
                'dbname' => 'oaz',
                'password' => 'magento2'
            ],
            'indexer' => [
                'host' => 'db',
                'username' => 'root',
                'dbname' => 'oaz',
                'password' => 'magento2'
            ]
        ]
    ],
    'resource' => [
        'default_setup' => [
            'connection' => 'default'
        ]
    ],
    'x-frame-options' => 'SAMEORIGIN',
    'session' => [
        'save' => 'redis',
        'redis' => [
            'host' => 'redis',
            'port' => '6379',
            'database' => 0,
            'disable_locking' => 1
        ]
    ],
    'lock' => [
        'provider' => 'db',
        'config' => [
            'prefix' => null
        ]
    ],
    'directories' => [
        'document_root_is_pub' => true
    ],
    'cache_types' => [
        'config' => 1,
        'layout' => 1,
        'block_html' => 1,
        'collections' => 1,
        'reflection' => 1,
        'db_ddl' => 1,
        'compiled_config' => 1,
        'eav' => 1,
        'customer_notification' => 1,
        'config_integration' => 1,
        'config_integration_api' => 1,
        'full_page' => 1,
        'config_webservice' => 1,
        'translate' => 1
    ],
    'downloadable_domains' => [
        'magento2.docker'
    ],
    'install' => [
        'date' => 'Fri, 05 May 2023 17:41:57 +0000'
    ],
    'static_content_on_demand_in_production' => 0,
    'force_html_minification' => 1,
    'cron_consumers_runner' => [
        'cron_run' => true,
        'max_messages' => 1000,
        'consumers' => [
            'product_action_attribute.update',
            'product_action_attribute.website.update',
            'media.storage.catalog.image.resize',
            'matchCustomerSegmentProcessor',
            'codegeneratorProcessor',
            'negotiableQuotePriceUpdate',
            'exportProcessor',
            'sharedCatalogUpdatePrice',
            'sharedCatalogUpdateCategoryPermissions',
            'inventory.source.items.cleanup',
            'inventory.mass.update',
            'inventory.reservations.cleanup',
            'inventory.reservations.update',
            'purchaseorder.toorder',
            'purchaseorder.transactional.email',
            'purchaseorder.validation',
            'quoteItemCleaner',
            'inventoryQtyCounter',
            'inventory.reservations.updateSalabilityStatus',
            'inventory.indexer.sourceItem',
            'inventory.indexer.stock',
            'media.content.synchronization',
            'media.gallery.renditions.update',
            'media.gallery.synchronization',
            'async.operations.all'
        ],
        'multiple_processes' => [

        ]
    ],
    'system' => [
        'default' => [
            'catalog' => [
                'search' => [
                    'engine' => 'elasticsearch7',
                    'elasticsearch7_server_port' => '9200',
                    'elasticsearch7_server_hostname' => 'elasticsearch'
                ]
            ],
            'system' => [
                'full_page_cache' => [
                    'caching_application' => '2'
                ]
            ]
        ]
    ],
    'http_cache_hosts' => [
        [
            'host' => 'varnish'
        ]
    ]
];
