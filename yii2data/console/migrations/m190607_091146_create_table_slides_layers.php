<?php

use yii\db\Migration;

class m190607_091146_create_table_slides_layers extends Migration
{
    public function up()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%slides_layers}}', [
            'id' => $this->primaryKey(),
            'slides_id' => $this->integer()->notNull(),
            'content' => $this->text()->notNull(),
            'class' => $this->string(),
            'data_x' => $this->string(),
            'data_y' => $this->string(),
            'data_customin' => $this->string(),
            'data_customout' => $this->string(),
            'data_hoffset' => $this->smallInteger(),
            'data_voffset' => $this->smallInteger(),
            'data_speed' => $this->smallInteger(),
            'data_start' => $this->smallInteger(),
            'data_easing' => $this->string(),
            'data_splitin' => $this->string(),
            'data_splitout' => $this->string(),
            'data_elementdelay' => $this->string(),
            'data_endelementdelay' => $this->string(),
            'data_end' => $this->string(),
            'data_endspeed' => $this->smallInteger(),
            'data_endeasing' => $this->string(),
            'data_captionhidden' => $this->string(),
            'style' => $this->string(),
            'btn_flag' => $this->tinyInteger()->notNull()->defaultValue('0'),
            'btn_url' => $this->string(),
            'btn_icon' => $this->string(),
            'btn_name' => $this->string(),
            'btn_class' => $this->string(),
        ], $tableOptions);

        $this->createIndex('slides_id', '{{%slides_layers}}', 'slides_id');
    }

    public function down()
    {
        $this->dropTable('{{%slides_layers}}');
    }
}
