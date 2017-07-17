<?php
use Illuminate\Database\Eloquent\Model;
// answers
// categiries
// choices
// grouds
// questions
// user_questiondetails
// user_questions
// users

class Choice  extends  Model  { 
        protected  $table='choices';
        protected  $primaryKey='id';
        public $timestamps = true;
        protected $hidden = ["created_by","updated_by","updated_at","created_at",];
        public function __construct(array $attributes = []) {
		    parent::__construct($attributes);
		}
}


class Answer  extends  Model  { 
        protected  $table='answers';
        protected $hidden = ["created_by","updated_by","updated_at","created_at","etc","weight"];
        protected  $primaryKey='id';
        public $timestamps = true;
        public function __construct(array $attributes = []) {
		    parent::__construct($attributes);
		}
}
class Category  extends  Model  { 
        protected  $table='categories';
        protected  $primaryKey='id';
        protected $hidden = ["created_by","updated_by","updated_at","created_at","description"];
        public $timestamps = true;

        public function diffs(){
           return $this->hasMany('Question')->groupBy('diff')->select('diff','category_id','group_id');
        }

        public function questions() {
                return $this->hasMany('Question');
        }

        public function __construct(array $attributes = []) {
		    parent::__construct($attributes);
		}
}

class Group  extends  Model  { 
        protected  $table='grouds';
        protected  $primaryKey='id';
        protected $hidden = ["created_by","updated_by","updated_at","created_at","description"];
        public $timestamps = true;

        public function categories(){
                return $this->hasMany('Category');
        }

        public function __construct(array $attributes = []) {
		    parent::__construct($attributes);
		}
}

class Question  extends  Model  { 
        protected  $table='questions';
        protected  $primaryKey='id';
        protected $hidden = ["created_by","updated_by","updated_at","created_at","description","jump","timerequired","required",];
        public $timestamps = true;

        public function choices() {
        	return  $this->hasMany('Choice','question_id');
        }

        public function answers(){
        	return $this->hasMany("Answer",'question_id');
        }

        public function category(){
        	return $this->belongsTo('Category','category_id');
        }

        public function group(){
                return $this->belongsTo('Groud','group_id');
        }


        public function __construct(array $attributes = []) {
		    parent::__construct($attributes);
		}
}


        
        