<?php

use yii\base\InvalidConfigException;
use yii\db\Schema;
use yii\rbac\DbManager;

class m140708_201431_rbac_init extends \yii\db\Migration
{

    public function up()
    {
        $this->crateAuth();
    }

    public function down()
    {
        $authManager = Yii::$app->getAuthManager();

        $createPost = $authManager->getPermission('createPost');
        $readPost = $authManager->getPermission('readPost');
        $updatePost = $authManager->getPermission('updatePost');

        $reader = $authManager->getRole('reader');
        $author = $authManager->getRole('author');

        $authManager->revoke($reader, 1);
        $authManager->revoke($author, 1);

        $authManager->remove($reader);
        $authManager->remove($author);

        $authManager->remove($createPost);
        $authManager->remove($readPost);
        $authManager->remove($updatePost);
    }

    private function crateAuth() {
        $auth = Yii::$app->getAuthManager();

        // add "createPost" permission
        $createPost = $auth->createPermission('createPost');
        $createPost->description = 'create a post';
        $auth->add($createPost);

        // add "readPost" permission
        $readPost = $auth->createPermission('readPost');
        $readPost->description = 'read a post';
        $auth->add($readPost);

        // add "updatePost" permission
        $updatePost = $auth->createPermission('updatePost');
        $updatePost->description = 'update post';
        $auth->add($updatePost);

        // add "reader" role and give this role the "readPost" permission
        $reader = $auth->createRole('reader');
        $auth->add($reader);
        $auth->addChild($reader, $readPost);

        // add "author" role and give this role the "createPost" permission
        // as well as the permissions of the "reader" role
        $author = $auth->createRole('author');
        $auth->add($author);
        $auth->addChild($author, $createPost);
        $auth->addChild($author, $reader);

        // usually implemented in your User model.
        $auth->assign($reader, 1);
        $auth->assign($author, 1);
    }
}
