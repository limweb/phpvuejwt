<?php
use \Jacwright\RestServer\RestException;
use Illuminate\Database\Capsule\Manager as Capsule; 
use \Jacwright\RestServer\RestController as BaseController;

class QuestionController extends BaseController {


    public function getJson($id = null,$a=null,$b=null,$c=null) {
        $o = new stdClass();
        $groups = Group::get();
        foreach ($groups as $group) {
            foreach($group->categories as $category){
                if($category->diffs->count() > 0 ){
                    foreach($category->diffs as $diff ) {
                        $diff->questions = Question::where('group_id',$diff->group_id)->where('diff',$diff->diff)->where('category_id',$diff->category_id)->get();
                        foreach ($diff->questions as $question) {
                            $question->choices;
                        }                    
                    }
                } else {
                    $category->questions = Question::where('group_id',$group->id)->where('diff',1)->where('category_id',$category->cat_id)->get();
                    foreach ($category->questions as $question) {
                            $question->choices;
                    }
                }
            }
        }

        $o->groups = $groups;
        return $o;
    }



    /**
     * @url POST /
     * @url GET /
     */
    public function questions()
    {
        $o = new stdClass();
        $groups = Group::get();
        foreach ($groups as $group) {
            foreach($group->categories as $category){
                if($category->diffs->count() > 0 ){
                    foreach($category->diffs as $diff ) {
                        $diff->questions = Question::where('group_id',$diff->group_id)->where('diff',$diff->diff)->where('category_id',$diff->category_id)->get();
                        foreach ($diff->questions as $question) {
                            $question->choices;
                        }                    
                    }
                } else {
                    $category->questions = Question::where('group_id',$group->id)->where('diff',1)->where('category_id',$category->cat_id)->get();
                    foreach ($category->questions as $question) {
                            $question->choices;
                    }
                }
            }
        }

        $o->groups = $groups;
        return base64_encode(json_encode($o));
    }


    public function postAnswer(){
        // dump(json_encode($this->server->jwtobj));
        // dump('status-->'.$this->server->jwtobj->status);
        // dump('verify-->'.$this->server->jwtobj->verify);
        // dump('validate-->'.$this->server->jwtobj->validate);
        // dump('token-->'.$this->server->jwtobj->token);
        // dump('jti-->'.$this->server->jwtobj->jti);
        // dump('iss-->'.$this->server->jwtobj->iss);
        // dump('uid-->'.$this->server->jwtobj->uid);
        // dump('username-->'.$this->server->jwtobj->username);
        // dump('role-->'.$this->server->jwtobj->role);
        // dump('level-->'.$this->server->jwtobj->level);
        // dump('host-->'.$this->server->jwtobj->host);

        $ua = new Useranswer();
        $ua->user_id = 1;
        $ua->json_date = json_encode($this->server->data);
        $rs = $ua->save();
        return $rs;
        // dump($rs);
    }


}