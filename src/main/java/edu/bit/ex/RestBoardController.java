package edu.bit.ex;

import org.springframework.http.HttpStatus;   
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.service.BoardService;
import edu.bit.ex.vo.BoardVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//REST : Representational State Transfer
//�ϳ��� URI�� �ϳ��� ������ ���ҽ��� ��ǥ�ϵ��� ����� ����

//http://localhost/spring02/list?bno=1 ==> url+�Ķ����
//http://localhost/spring02/list/1 ==> url
//RestController�� ������ 4.0���� ����
//@Controller, @RestController �������� �޼��尡 ����Ǹ� ȭ����ȯ�� ����

@Log4j
@AllArgsConstructor
@RestController
@RequestMapping("/restful/*")
public class RestBoardController {

   private BoardService boardService;

    // 1. list(ó�� ���� ȭ���̹Ƿ� ȭ���� ���ڿ��� ��������Ƿ� @Controller������� ���� - veiw(ȭ��)�� ����
   @GetMapping("/board")
   public ModelAndView list(ModelAndView mav) {
      mav.setViewName("board/rest_list");
      mav.addObject("list", boardService.getList());

      return mav;
   }

   @GetMapping("/board/{bId}")
   public ModelAndView rest_content_view(BoardVO boardVO, ModelAndView mav) {

      log.info("rest_content_view");
      mav.setViewName("/board/rest_content_view");
      mav.addObject("rest_content_view", boardService.get(boardVO.getbId()));
      boardService.uphitBoard(boardVO.getbId());
      return mav;
   }
   
   @DeleteMapping("/board/{bId}")
   public ResponseEntity<String> rest_delete(BoardVO boardVO,Model model) {
      ResponseEntity<String> entity = null;
      log.info("rest_delete..");
      try {
         boardService.remove(boardVO.getbId());
            // ������ �����ϸ� ���� ���¸޽��� ����
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // ��� ������ �����ϸ� ���� ���¸޽��� ����
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // ���� ó�� HTTP ���� �޽��� ����
        return entity; 
   }   
   
   @PutMapping("/board/{bId}")
   public ResponseEntity<String> rest_update(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
   	ResponseEntity<String> entity = null;
	
	   	log.info("rest_update..");
	   	try {
	   		boardService.modifyBoard(boardVO);
	   		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	   	} catch (Exception e) {
	   		e.printStackTrace();
	   		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	   	}
	
	   	return entity;
   }
   
   @GetMapping("/board/reply/{bId}")
   public ModelAndView rest_reply_view(BoardVO boardVO, ModelAndView mav) {

      log.info("rest_reply_view");
      mav.setViewName("/board/rest_reply_view");
      mav.addObject("rest_reply_view", boardService.getReply(boardVO.getbId()));
      return mav;
   } 
   

   @PostMapping("/board/reply/{bId}") 
	public ResponseEntity<String> rest_reply(@RequestBody BoardVO boardVO, Model model) {
		ResponseEntity<String> entity = null;
		log.info("rest_reply");

		try {
			boardService.replyBoard(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
   
   @GetMapping("/board/write")
   public ModelAndView rest_write_view(ModelAndView mav) {

      log.info("rest_write_view");
      mav.setViewName("/board/rest_write_view");
      return mav;
   }	
   
   @PutMapping("/board/write")
   public ResponseEntity<String> write_view(@RequestBody BoardVO boardVO, ModelAndView modelAndView) {
   	ResponseEntity<String> entity = null;

   	log.info("rest_write_view..");
   	try {
   		boardService.writeBoard(boardVO);
   		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
   	} catch (Exception e) {
   		e.printStackTrace();
   		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
   	}

   	return entity;
   }
}