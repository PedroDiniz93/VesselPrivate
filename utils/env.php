<?php
return [
    'cache' => [
        'frontend' => [
            'default' => [
                'backend' => 'Cm_Cache_Backend_Redis',
                'backend_options' => [
                    'server' => 'redis',
                    'port' => '6379',
                    'database' => 1
                ],
                'id_prefix' => '8c0_'
            ],
            'page_cache' => [
                'backend' => 'Cm_Cache_Backend_Redis',
                'backend_options' => [
                    'server' => 'redis',
                    'port' => '6379',
                    'database' => 2
                ],
                'id_prefix' => '8c0_'
            ]
        ]
    ],
    'MAGE_MODE' => 'developer',
    'cron' => [
        'enabled' => 1
    ],
    'backend' => [
        'frontName' => 'admin'
    ],
    'queue' => [
        'consumers_wait_for_messages' => 0
    ],
    'db' => [
        'connection' => [
            'default' => [
                'host' => '172.24.0.3',
                'username' => 'magento2',
                'dbname' => 'magento2',
                'password' => 'magento2',
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;',
                'active' => '1',
                'driver_options' => [
                    1014 => false
                ]
            ],
            'indexer' => [
                'host' => '172.24.0.3',
                'username' => 'magento2',
                'dbname' => 'magento2',
                'password' => 'magento2',
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;',
                'active' => '1',
                'persistent' => null
            ]
        ],
        'table_prefix' => ''
    ],
    'system' => [
        'default' => [
            'catalog' => [
                'search' => [
                    'engine' => 'elasticsuite',
                    'elasticsearch7_server_hostname' => '172.24.0.4',
                    'elasticsearch7_server_port' => '9200'
                ]
            ],
            'system' => [
                'full_page_cache' => [
                    'caching_application' => '2'
                ]
            ],
            'smile_elasticsuite_core_base_settings' => [
                'es_client' => [
                    'servers' => '172.24.0.4:9200'
                ]
            ]
        ]
    ],
    'crypt' => [
        'key' => '9ee7ae2d0746f1377502f15b970f28a7'
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
            'prefix' => ''
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
        'target_rule' => 1,
        'config_webservice' => 1,
        'translate' => 1,
        'vertex' => 1
    ],
    'http_cache_hosts' => [
        [
            'host' => 'varnish'
        ]
    ],
    'downloadable_domains' => [
        'magento2.docker'
    ],
    'install' => [
        'date' => 'Thu, 28 Jan 2021 02:39:19 +0000'
    ],
    'static_content_on_demand_in_production' => 1,
    'force_html_minification' => 1,
    'cron_consumers_runner' => [
        'cron_run' => true,
        'max_messages' => 1000,
        'consumers' => [
            'async.operations.all',
            'sales.rule.update.coupon.usage'
        ]
    ],
    'db_logger' => [
        'output' => 'disabled',
        'log_everything' => 1,
        'query_time_threshold' => '0.001',
        'include_stacktrace' => 1
    ]
];
