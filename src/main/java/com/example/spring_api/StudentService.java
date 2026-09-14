package com.example.spring_api;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

@Service
public class StudentService {
    private final StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    public List<Student> searchStudents(String keyword) {
        if (keyword == null || keyword.isBlank()) {
            return getAllStudents();
        }

        String value = keyword.trim();
        return studentRepository
                .findByStudentCodeContainingIgnoreCaseOrFullNameContainingIgnoreCaseOrEmailContainingIgnoreCaseOrPhoneContainingIgnoreCase(
                        value, value, value, value);
    }

    public Student getStudentById(UUID id) {
        return studentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Student not found with id: " + id));
    }

    public Student createStudent(Student student) {
        return studentRepository.save(student);
    }

    public Student updateStudent(UUID id, Student student) {
        Student existingStudent = getStudentById(id);
        existingStudent.setStudentCode(student.getStudentCode());
        existingStudent.setFullName(student.getFullName());
        existingStudent.setEmail(student.getEmail());
        existingStudent.setPhone(student.getPhone());
        existingStudent.setClassName(student.getClassName());
        return studentRepository.save(existingStudent);
    }

    public void deleteStudent(UUID id) {
        if (!studentRepository.existsById(id)) {
            throw new IllegalArgumentException("Student not found with id: " + id);
        }
        studentRepository.deleteById(id);
    }
}
