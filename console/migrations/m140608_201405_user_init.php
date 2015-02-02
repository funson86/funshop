<?php

use yii\db\Schema;
use yii\db\Migration;

class m140608_201405_user_init extends Migration
{
    public function up()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            // http://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%user}}', [
            'id' => Schema::TYPE_PK,
            'username' => Schema::TYPE_STRING . ' NOT NULL',
            'auth_key' => Schema::TYPE_STRING . '(32) NOT NULL',
            'token' => Schema::TYPE_STRING . '(64)',
            'access_token' => Schema::TYPE_STRING . '(255)',
            'password_hash' => Schema::TYPE_STRING . ' NOT NULL',
            'password_reset_token' => Schema::TYPE_STRING,
            'email' => Schema::TYPE_STRING . ' NOT NULL',
            'role' => Schema::TYPE_STRING . '(64) NOT NULL DEFAULT "user"',

            'status' => Schema::TYPE_SMALLINT . ' NOT NULL DEFAULT 10',
            'created_at' => Schema::TYPE_INTEGER . ' NOT NULL',
            'updated_at' => Schema::TYPE_INTEGER . ' NOT NULL',
        ], $tableOptions);

        // Indexes
        $this->createIndex('username', '{{%user}}', 'username', true);
        $this->createIndex('role', '{{%user}}', 'role');
        $this->createIndex('status', '{{%user}}', 'status');
        $this->createIndex('created_at', '{{%user}}', 'created_at');

        //profile table
        $this->createTable(
            '{{%profile}}',
            [
                'user_id' => Schema::TYPE_PK,
                'name' => Schema::TYPE_STRING . '(64)',
                'surname' => Schema::TYPE_STRING . '(64)',
                'avatar_url' => Schema::TYPE_STRING . '(64)'
            ],
            $tableOptions
        );

        // Foreign Keys
        $this->addForeignKey('FK_profile_user', '{{%profile}}', 'user_id', '{{%user}}', 'id', 'CASCADE', 'CASCADE');

        // Users emails table
        $this->createTable(
            '{{%user_email}}',
            [
                'user_id' => Schema::TYPE_INTEGER . ' NOT NULL',
                'email' => Schema::TYPE_STRING . '(64)',
                'token' => Schema::TYPE_STRING . '(64)',
                'PRIMARY KEY (`user_id`, `token`)'
            ],
            $tableOptions
        );

        // Foreign Keys
        $this->addForeignKey('FK_user_email_user', '{{%user_email}}', 'user_id', '{{%user}}', 'id', 'CASCADE', 'CASCADE');


        // Add super administrator
        $this->execute($this->getUserSql());
        $this->execute($this->getProfileSql());
    }

    /**
     * @return string SQL to insert first user
     */
    private function getUserSql()
    {
        $time = time();
        $password_hash = Yii::$app->getSecurity()->generatePasswordHash('qwe1234');
        $auth_key = Yii::$app->getSecurity()->generateRandomKey();
        return "INSERT INTO {{%user}} (`username`, `email`, `auth_key`, `password_hash`, `password_reset_token`, `role`, `status`, `created_at`, `updated_at`)
                VALUES ('admin', 'admin@demo.com', '$auth_key', '$password_hash', '', 'admin', 1, $time, $time)";
    }

    /**
     * @return string SQL to insert first profile
     */
    private function getProfileSql()
    {
        return "INSERT INTO {{%profile}} (`user_id`, `name`, `surname`) VALUES (1, 'Administration', 'Site')";
    }

    public function down()
    {
        $this->dropTable('{{%user_email}}');
        $this->dropTable('{{%profile}}');
        $this->dropTable('{{%user}}');
    }
}
