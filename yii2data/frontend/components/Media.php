<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace frontend\components;

/**
 * Description of Media
 *
 * @author artmarkov
 */
class Media extends \artsoft\media\models\Media {
    /**
     * @return \yii\db\ActiveQuery
     */
    public static function getAlbumList($album_id)
    {
        return self::find()
               // ->innerJoin('media', 'media.id = media_manager.media_id')                
                ->where(['album_id' => $album_id])                
                ->indexBy('id')
//                ->orderBy('sort')
                ->asArray()->all();    
    } 
    
}
