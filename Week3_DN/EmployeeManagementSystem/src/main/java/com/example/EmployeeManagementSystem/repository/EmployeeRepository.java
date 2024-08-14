package com.example.EmployeeManagementSystem.repository;

import com.example.EmployeeManagementSystem.Projections.EmployeeNameOnly;
import com.example.EmployeeManagementSystem.entity.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    Page<Employee> findByName(String name, Pageable pageable);

    @Query("SELECT e FROM Employee e WHERE e.email = :email")
    Employee findByEmail(@Param("email") String email);

    @Query("SELECT e FROM Employee e WHERE e.department.name = :deptName")
    Page<Employee> findByDepartmentName(@Param("deptName") String deptName, Pageable pageable);
    @Query("SELECT new com.example.EmployeeNameOnly(e.name) FROM Employee e")
    List<EmployeeNameOnly> findEmployeeNames();

}
