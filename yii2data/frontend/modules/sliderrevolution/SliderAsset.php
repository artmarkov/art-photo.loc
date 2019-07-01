<?php

namespace frontend\modules\sliderrevolution;

/**
 * Class SliderAsset
 */
class SliderAsset extends \yii\web\AssetBundle
{
     public $sourcePath = '@public/plugins/revolution-slider';

    public $css = [
        'css/settings.css',
    ];
    public $js = [
        'js/jquery.themepunch.plugins.min.js',
        'js/jquery.themepunch.revolution.min.js',
        '../../js/slider_revolution.js',
    ];
    public $depends = [
        'yii\web\JqueryAsset',
    ];
    public $publishOptions = [
        'forceCopy' => true,
    ];

//    public function init()
//    {
//        $module = \Yii::$app->getModule('sliderrevolution');
//        $this->sourcePath = $module->getPluginLocation();
//        parent::init();
//    }
}
