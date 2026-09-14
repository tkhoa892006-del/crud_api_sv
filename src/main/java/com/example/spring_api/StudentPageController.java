package com.example.spring_api;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentPageController {
    private final StudentService studentService;

    public StudentPageController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping({"/students", "/students.html"})
    public String studentsPage(@RequestParam(required = false) String keyword, Model model) {
        model.addAttribute("students", studentService.searchStudents(keyword));
        model.addAttribute("keyword", keyword == null ? "" : keyword);
        return "students";
    }
}
