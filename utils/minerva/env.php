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
                'id_prefix' => 'f53_'
            ],
            'page_cache' => [
                'backend' => 'Cm_Cache_Backend_Redis',
                'backend_options' => [
                    'server' => 'redis',
                    'port' => '6379',
                    'database' => 2
                ],
                'id_prefix' => 'f53_'
            ]
        ],
        'allow_parallel_generation' => false,
        'graphql' => [
            'id_salt' => 'nxWR5O3tV660SXXyxU7GqpB4epImmrgg'
        ]
    ],
    'MAGE_MODE' => 'developer',
    'cron' => [
        'enabled' => 0
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
                'host' => '172.18.0.99',
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
                'host' => '172.18.0.99',
                'username' => 'magento2',
                'dbname' => 'magento2',
                'password' => 'magento2',
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;'
            ]
        ],
        'table_prefix' => ''
    ],
    'system' => [
        'default' => [
            'catalog' => [
                'search' => [
                    'engine' => 'elasticsuite',
                    'opensearch_server_hostname' => 'opensearch',
                    'opensearch_server_port' => '9200'
                ]
            ],
            'system' => [
                'full_page_cache' => [
                    'caching_application' => '2'
                ]
            ],
            'smile_elasticsuite_core_base_settings' => [
                'es_client' => [
                    'servers' => 'opensearch:9200',
                    'enable_https_mode' => 0,
                    'http_auth_user' => '',
                    'http_auth_pwd' => '',
                    'enable_http_auth' => false
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
        'provider' => 'db'
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
    'static_content_on_demand_in_production' => 0,
    'force_html_minification' => 1,
    'cron_consumers_runner' => [
        'cron_run' => false,
        'max_messages' => 10000,
        'consumers' => [

        ]
    ],
    'remote_storage' => [
        'driver' => 'file'
    ],
    'checkout' => [
        'async' => 0,
        'deferred_total_calculating' => 0
    ],
    'db_logger' => [
        'output' => 'disabled',
        'log_everything' => 1,
        'query_time_threshold' => '0.001',
        'include_stacktrace' => 1
    ]
];
