<?php

Yii::$container->set(\kartik\date\DatePicker::class, [
        'type' => \kartik\date\DatePicker ::TYPE_INPUT,
        'options' => ['placeholder' => ''],
        'convertFormat' => true,
        'pluginOptions' => [
            'format' => 'dd.MM.yyyy',
            'autoclose' => true,
            'weekStart' => 1,
            'startDate' => '01.01.1930',
            'endDate' => '01.01.2030',
            'todayBtn' => 'linked',
            'todayHighlight' => true,
        ]
    ]);
 
Yii::$container->set(\kartik\datetime\DateTimePicker::class, [
        'type' => \kartik\datetime\DateTimePicker::TYPE_INPUT,
        'options' => ['placeholder' => ''],
        'convertFormat' => true,
        'pluginOptions' => [
            'format' => 'dd.MM.yyyy hh:i',
            'autoclose' => true,
            'weekStart' => 1,
            'startDateTime' => '01.01.1930 00:00',
            'endDateTime' => '01.01.2030 00:00',
            'todayBtn' => 'linked',
            'todayHighlight' => true,
        ]
    ]);

$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'backend',
    'homeUrl' => '/admin',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'modules' => [
        'settings' => [
            'class' => 'artsoft\settings\SettingsModule',
        ],
        'menu' => [
            'class' => 'artsoft\menu\MenuModule',
        ],
        'translation' => [
            'class' => 'artsoft\translation\TranslationModule',
        ],
        'user' => [
            'class' => 'artsoft\user\UserModule',
        ],
        'media' => [
            'class' => 'artsoft\media\MediaModule',
            'routes' => [
                'baseUrl' => '', // Base absolute path to web directory
                'basePath' => '@frontend/web', // Base web directory url
                'uploadPath' => 'uploads', // Path for uploaded files in web directory
            ],
            'thumbs' => [
                'small' => [
                    'name' => 'Мелкий',
                    'size' => [128, 72],
                ],
                'square' => [
                    'name' => 'Квадрат',
                    'size' => [320, 320],
                ],   
                'medium' => [
                    'name' => 'Средний',
                    'size' => [720, 480],
                ],            
        ],
        ],
        'post' => [
            'class' => 'artsoft\post\PostModule',
        ],
        'page' => [
            'class' => 'artsoft\page\PageModule',
        ],
        'seo' => [
            'class' => 'artsoft\seo\SeoModule',
        ],
        'comment' => [
            'class' => 'artsoft\comment\CommentModule',
        ],        
        'mediamanager' => [
            'class' => 'artsoft\mediamanager\MediamanagerModule',
        ],
        'portfolio' => [
            'class' => 'artsoft\portfolio\PortfolioModule',
            'thumbnailSize' => 'square',
        ],
        'block' => [
	    'class' => 'artsoft\block\BlockModule',
	],
        'carousel' => [
            'class' => 'artsoft\carousel\CarouselModule',
        ], 
        'parallax' => [
            'class' => 'artsoft\parallax\ParallaxModule',
        ],
        'feedback' => [
            'class' => 'artsoft\feedback\FeedbackModule',
        ],
        'slides' => [
            'class' => 'artsoft\slides\SlidesModule',
        ],
        'dbmanager' => [
            'class' => 'artsoft\dbmanager\DbmanagerModule',
            'dumpPath' => '@public/db/',
        ],
    ],
    'components' => [
        'request' => [
            'baseUrl' => '/admin',
        ],
        'assetManager' => [
            'bundles' => [
                'yii\bootstrap\BootstrapAsset' => [
                    //'sourcePath' => '@artsoft/yii2-art-core/assets/theme/bootswatch/custom',
                    'sourcePath' => '@artsoft/yii2-art-core/assets/theme/bootstrap/dist/css',
                    'css' => ['bootstrap.css']
                ],
            ],
        ],
        'urlManager' => [
            'class' => 'artsoft\web\MultilingualUrlManager',
            'showScriptName' => false,
            'enablePrettyUrl' => true,
            'multilingualRules' => false,
            'rules' => [
                //add here local frontend controllers
                //'<controller:(test)>' => '<controller>/index',
                //'<controller:(test)>/<id:\d+>' => '<controller>/view',
                //'<controller:(test)>/<action:[\w_\-]+>/<id:\d+>' => '<controller>/<action>',
                //'<controller:(test)>/<action:[\w_\-]+>' => '<controller>/<action>',
                //art cms and other modules routes
                '/' => 'site/index',
                '<module:[\w_\-]+>/' => '<module>/default/index',
                '<module:[\w_\-]+>/<action:[\w_\-]+>/<id:\d+>' => '<module>/default/<action>',
                '<module:[\w_\-]+>/<action:(create)>' => '<module>/default/<action>',
                '<module:[\w_\-]+>/<controller:[\w_\-]+>' => '<module>/<controller>/index',
                '<module:[\w_\-]+>/<controller:[\w_\-]+>/<action:[\w_\-]+>/<id:\d+>' => '<module>/<controller>/<action>',
                '<module:[\w_\-]+>/<controller:[\w_\-]+>/<action:[\w_\-]+>' => '<module>/<controller>/<action>',
            ]
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
    ],
    'params' => $params,
];
