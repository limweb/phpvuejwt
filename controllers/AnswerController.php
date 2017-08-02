<?php
use \Jacwright\RestServer\RestException;
use \Jacwright\RestServer\RestController as BaseController;

class AnswerController  extends BaseController {


	/**
	 * @noAuth
	*/
	public function getAnswer($chk=0) {
		// chk = 0  nopage get all , $chk = 1 use pagination
		$o = new stdClass();
		$page = (isset($this->get->page) ? $this->get->page : 1 );
		$perpage = (isset($this->get->erpage) ? $this->get->perpage : 10 );
		// $sort = ['id'=>'asc']; == &sort[id]=asc&sort[name]=desc
		$sort = (isset($this->get->sort) ? $this->get->sort : []);
		$qry = Useranswer::join('users','users.id','=','useranswers.user_id')->select('useranswers.*','users.user');

		foreach ($sort as $key => $value) {
			$qry->orderBy($key,$value);
		}
		if($chk){
			$answers = $qry->take($perpage)->skip(($page-1)*$perpage)->get();
		} else {
			$answers = $qry->get();
		}

		foreach ($answers as $answer) {
			$obj = json_decode($answer->json_date);
			foreach($obj->competency as $competency ) {
				switch ($competency->category_id) {
					case '1':
							$answer->Sel_sum  = $competency->score;
							$answer->Sel_persent  = $competency->score/10;
							$answer->Sel_avc  = $competency->score/30*100;
						break;
					case '2':
							$answer->Rel_sum  = $competency->score;
							$answer->Rel_persent  = $competency->score/10;
							$answer->Rel_avc  = $competency->score/30*100;

						break;
					case '3':
							$answer->Com_sum  = $competency->score;
							$answer->Com_persent  = $competency->score/10;
							$answer->Com_avc  = $competency->score/30*100;

						break;
					case '4':
							$answer->Res_sum  = $competency->score;
							$answer->Res_persent  = $competency->score/10;
							$answer->Res_avc  = $competency->score/30*100;

						break;
					case '5':
							$answer->Fle_sum  = $competency->score;
							$answer->Fle_persent  = $competency->score/10;
							$answer->Fle_avc  = $competency->score/30*100;

						break;
					case '6':
							$answer->Dig_sum  = $competency->score;
							$answer->Dig_persent  = $competency->score/10;
							$answer->Dig_avc  = $competency->score/30*100;
						break;
					default:
						break;
				}
			}
			foreach ($obj->personality as $personality) {
				switch ($personality->category_id) {
					case '1':
					$answer->EI_a  = -$personality->scorea;
					$answer->EI_b  = $personality->scoreb;
					$answer->EI_diff  = ($personality->scoreb-$personality->scorea)/7*100;
						break;
					case '2':
					$answer->SN_a  = -$personality->scorea;
					$answer->SN_b  = $personality->scoreb;
					$answer->SN_diff  = ($personality->scoreb-$personality->scorea)/7*100;
						break;
					case '3':
					$answer->TF_a  = -$personality->scorea;
					$answer->TF_b  = $personality->scoreb;
					$answer->TF_diff  = ($personality->scoreb-$personality->scorea)/7*100;
						break;
					case '4':
					$answer->JP_a  = -$personality->scorea;
					$answer->JP_b  = $personality->scoreb;
					$answer->JP_diff  = ($personality->scoreb-$personality->scorea)/7*100;
						break;
					case '5':
					$answer->AT_a  = -$personality->scorea;
					$answer->AT_b  = $personality->scoreb;
					$answer->AT_diff  = ($personality->scoreb-$personality->scorea)/7*100;
						break;
					default:
						break;
				}
			}
		}
		// $o->chk = $chk;
		// $o->get = $this->get;
		// $o->page = $page;
		// $o->perpage = $perpage;
		// $o->sort = $sort;
		$o->data = $answers;
		return $o;
	}


}
