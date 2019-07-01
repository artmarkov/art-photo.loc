<?php

namespace frontend\controllers;

use frontend\actions\PageAction;
use frontend\actions\PostAction;
use artsoft\page\models\Page;
use Yii;
use yii\data\Pagination;
use yii\web\NotFoundHttpException;
use backend\modules\event\models\EventSchedule;
use artsoft\parallax\models\Parallax;
use artsoft\carousel\models\Carousel;
use yii\data\ArrayDataProvider;
/**
 * Site controller
 */
class SiteController extends \artsoft\controllers\BaseController
{
    public $freeAccess = true;

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'artsoft\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {
         $parallax = Parallax::find()
                ->where(['slug' => 'parallax-main'])
                ->andwhere(['status' => Parallax::STATUS_ACTIVE])->one();
         
         
         $query = Carousel::find()
                ->where(['slug' => 'carousel-main'])
                ->andWhere(['status' => Carousel::STATUS_ACTIVE])->one();
         
         // echo '<pre>' . print_r($query, true) . '</pre>';
         if(!empty($query)) {
          $carousel = \yii\helpers\ArrayHelper::toArray($query);
          $carousel['model_name'] = $query->className();
         }
         else {
         $carousel['model_name'] = NULL;
         }
        return $this->render('index', [
                'parallax' => $parallax,
                'carousel' => $carousel,
            ]);
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new \frontend\models\ContactForm();
        
        //$model->scenario = 'contact';
        
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
           if ($model->sendEmail(Yii::$app->settings->get('general.email'))) {
                Yii::$app->session->setFlash('success', '<i class="fa fa-check-circle"></i>' . Yii::t('art','Thank you for contacting us. We will respond to you as soon as possible.'));
            } else {
                Yii::$app->session->setFlash('error', '<i class="fa fa-frown-o"></i>' . Yii::t('art','Thank you for contacting us. We will respond to you as soon as possible.'));
            }           
            $model->save();            
            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
         $query = Carousel::find()
                ->where(['slug' => 'karousel-about'])
                ->andWhere(['status' => Carousel::STATUS_ACTIVE])->one();
         
          if(!empty($query)) {
          $carousel = \yii\helpers\ArrayHelper::toArray($query);
          $carousel['model_name'] = $query->className();
         }
         else {
         $carousel['model_name'] = NULL;
         }
          
         
        return $this->render('about', [
                'carousel' => $carousel,
            ]);
    }
    /**
     * 
     * @return render
     */
    public function actionPortfolio()
    {
                 
        return $this->render('portfolio');
    }
    
   

}
