package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.hansung.entity.User;
import kr.ac.hansung.exception.NotFoundException;
import kr.ac.hansung.service.UserService;
import lombok.Getter;
import lombok.Setter;

@RestController
@RequestMapping(path = "/api/users")
public class UserController {
	
	@Autowired
    private UserService userService;
	
	@RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> retrieveAllplans() {
        // Getting all plans in application...
        final List<User> users = userService.getAllUsers();

        if (users.isEmpty()) {
         return new ResponseEntity<>(HttpStatus.NO_CONTENT);
      }

        return ResponseEntity.ok(users);
      //return new ResponseEntity<List<Category>>(plans, HttpStatus.OK);
      
    }
	
	// DTO(Data Transfer Object) : 계층간 데이터 교환을 위한 객체, 여기서는 클라이언트(Postman)에서 오는 데이터를 수신할 목적으로 사용
    // Product와 ProductDto와의 차이를 비교해서 살펴보기 바람
    @RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<User> createUser(@RequestBody @Valid UserDto request) {

		User user = userService.createUser(request.getUserId());

		//return new ResponseEntity<User>(user, HttpStatus.CREATED);
		return ResponseEntity.status(HttpStatus.CREATED).body(user);
	}
    
	@RequestMapping(path = "/{email}", method = RequestMethod.PUT)
	public ResponseEntity<User> updateUser(@PathVariable String email, @RequestBody @Valid UserDto request) {
		
		User currentUser = userService.getUserById(email);
		
		if (currentUser == null) {
			throw new NotFoundException(email);
		}
		
		currentUser.setUserID(request.getUserId());
		
		
		userService.updateUser(currentUser);
		return new ResponseEntity<User>(currentUser, HttpStatus.OK);
		
		
		
	}

	@RequestMapping(path = "/{email}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteUser(@PathVariable String email) {
		// Getting the requiring user; or throwing exception if not found
		final User user = userService.getUserById(email);
		
		if(user == null)
			throw new NotFoundException(email);						

		// Deleting user from the application...
		userService.deleteUser(user);

		return new ResponseEntity<>(HttpStatus.NO_CONTENT); //아래와 동일한 기능
		//return ResponseEntity.noContent().build();

	}
	
	@Getter
	@Setter
	static class UserDto {
		
        @NotNull(message = "name is required")
        @Size(message = "name must be equal to or lower than 300", min = 1, max = 300)
        private String userId;           
        
       
	}
	
}
