package com.projectmanager.controller;

import com.projectmanager.service.service_impl.ProjectServiceImpl;
import com.projectmanager.service.service_impl.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/project")
public class test {

    @Autowired
    ProjectServiceImpl projectService;

    @Autowired
    TestService testService;

    @GetMapping("/projectList")
    public ResponseEntity<?> projectList(){
        return ResponseEntity.ok(projectService.findAll());
    }

    @GetMapping("/taskList")
    public ResponseEntity<?> taskList(){
        return ResponseEntity.ok(testService.getAllTask());
    }

}
