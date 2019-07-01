<?php

namespace frontend\modules\auth\controllers;


class DefaultController extends \artsoft\auth\controllers\DefaultController
{
       public $freeAccessActions = ['login', 'logout', 'captcha',        
                'reset-password', 'reset-password-request', 'update-password'];
}