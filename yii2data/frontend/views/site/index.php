<?php
/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\widgets\LinkPager;
use frontend\modules\sliderrevolution\SliderRevolution;
use frontend\widgets\CarouselWidget;
use artsoft\block\models\Block;


?>
<div class="site-index">
   
    <!-- REVOLUTION SLIDER -->
     
<?php 
//echo '<pre>' . print_r(\backend\modules\section\models\Slides::getSlidesData(), true) . '</pre>';
echo SliderRevolution::widget([
    'config' => ['delay' => 9000, 'startwidth' => 1170, 'startheight' => 500, 'hideThumbs' => 200, 'fullWidth' => '"on"', 'forceFullWidth' => '"off"'],
    'container' => ['class' => 'fullwidthbanner-container roundedcorners'],
    'wrapper' => ['class' => 'fullwidthbanner'],
    'ulOptions' => [],
    'slides' => \artsoft\slides\models\Slides::getSlidesData(),
]);

?>
   
    <!-- /REVOLUTION SLIDER -->
    
    <!-- WELCOME -->
    <section id = "welcome" class="container">
        <?= Block::getHtml('welcome'); ?>
    </section>
    <!-- /WELCOME -->

        <div class="divider"></div><!-- divider -->
        
    <!-- Positive -->
    <section class="container">
            <div class="row">
                <div class="col-md-6 padding50 nopadding-top">
                    
                    <?= Block::getHtml('dlya-kogo-my-rabotaem'); ?>
                    <?= Html::a('<i class="fa fa-chevron-circle-right"></i><span class="uppercase">Напишите мне</span>', ["/site/contact"], ['class' => 'btn btn-primary btn-lg']) ?>

                </div>

                <div class="col-md-6">     
                    <?php if($carousel['model_name'] != NULL) :?>
                    <?= CarouselWidget::widget(
                            [
                                'content_items' => artsoft\mediamanager\models\MediaManager::getMediaList($carousel['model_name'], $carousel['id']),
                                'owl_options' => $carousel,
                                'options' =>
                                [
                                    'type' => 'images',
                                    'size' => 'medium',
                                    'class' => 'owl-carousel text-center controlls-over',
                                ],
                    ]);
                    ?>
                    <?php endif; ?>
                </div>
            </div>
    </section>
    <!-- /Positive -->

    <div class="divider"> 
        <i class="fa fa-leaf"></i>
    </div>
              

    <!-- PARALLAX -->
     <?= \frontend\widgets\ParallaxWidget::widget(['parallax' => $parallax]); ?>
    <!-- PARALLAX -->
   
 
    <!-- SERVICES -->
    <section class="margin-top50">
        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <?= Block::getHtml('format-raboty-fotostudii'); ?>
                    <hr />

                    <h2><strong>Варианты</strong> работы студии:</h2>

                    <!-- SERVICE 1 -->
                    <div class="row margin-top30">

                        <!-- SERVICE 1 -->
                        <div class="col-md-2 text-center margin-bottom20">
                            <i class="nomargin featured-icon fa fa-heart-o"></i>
                        </div>

                        <div class="col-md-10">
                             <?= Block::getHtml('individualnaya-semka'); ?>
                             <?= Html::a('<i class="fa fa-sign-out"></i><span class="uppercase">Записаться</span>', ["/site/contact"], ['class' => 'btn btn-xs pull-right']) ?>

                        </div>

                    </div>

                    <div class="divider half-margins"><!-- divider -->
                        <i class="fa fa-plus-circle"></i>
                    </div>

                    <!-- SERVICE 2 -->
                    <div class="row margin-top30">

                        <div class="col-md-2 text-center margin-bottom20">
                            <i class="nomargin featured-icon fa fa-smile-o"></i>
                        </div>

                        <div class="col-md-10">
                            
                             <?= Block::getHtml('gruppovaya-semka'); ?>
                             <?= Html::a('<i class="fa fa-sign-out"></i><span class="uppercase">Записаться</span>', ["/site/contact"], ['class' => 'btn btn-xs pull-right']) ?>

                        </div>

                    </div>
                </div>  
            </div>  
        </div>
    </section>
    <hr />
    <section class="margin-top50">
        <div class="container">
            <?= Block::getHtml('prays'); ?>
        </div>
    </section>
    <!-- /SERVICES -->    
    <div class="divider  styleColor"><!-- divider -->
        <i class="fa fa-leaf"></i>
    </div>
    <!--TESTIONARS-->
    <section id="testionars"  class="padding50 margin-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    
                             <?= Block::getHtml('preimushchestva-nashey-raboty'); ?>
                    
                </div>

                <div class="col-md-6">
                             <?= Block::getHtml('chto-o-nas-govoryat'); ?>
                    
                     <?=  CarouselWidget::widget(
                            [
                                'content_items' => artsoft\feedback\models\Feedback::getFeedbackList(),
                                'owl_options' => artsoft\feedback\models\Feedback::getCarouselOption(),
                                'options' =>
                                [
                                    'type' => 'text',
                                    'class' => 'owl-carousel text-center',
                                ],
                    ]);
                    ?>                        
                 
                    <div class="row text-center nomargin-bottom">
                        <?= Html::a('<i class="fa fa-sign-out"></i><span class="uppercase">Оставить отзыв</span>', ["/site/contact"], ['class' => 'btn btn-xs pull-right']) ?>
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/TESTIONARS-->
    
    <div class="divider"><!-- divider -->
        <i class="fa fa-leaf"></i>
    </div>

    <!-- CALLOUT -->
    <section class="container">

        <div class="bs-callout special-row text-center nomargin">
            <h3>Записаться на <strong>бесплатную</strong> съемку! 
                
                <?= Html::a('<i class="fa fa-chevron-circle-right"></i>Записаться</span>', ["/site/contact"], ['class' => 'btn btn-primary btn-lg']) ?>
                       
               </h3>
        </div>

    </section>
    <!-- /CALLOUT -->
</div>