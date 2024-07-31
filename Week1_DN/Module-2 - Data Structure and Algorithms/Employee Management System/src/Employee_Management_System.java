import java.util.*;
public class Employee_Management_System{
    public static void main(String[] args) {
        EmployeeManager manager = new EmployeeManager(5);

        // Adding employees
        manager.addEmployee(new Employee("E001", "Ramesh", "Developer", 87000));
        manager.addEmployee(new Employee("E002", "Suresh", "Designer", 75000));
        manager.addEmployee(new Employee("E003", "Deva", "Manager", 93000));

        // Traversing employees
        System.out.println("All Employees:");
        manager.traverseEmployees();

        // Searching for an employee
        System.out.println("\nSearching for employee with ID E002:");
        Employee employee = manager.searchEmployeeById("E002");
        if (employee != null) {
            System.out.println(employee);
        } else {
            System.out.println("Employee not found.");
        }

        // Deleting an employee
        System.out.println("\nDeleting employee with ID E002:");
        boolean deleted = manager.deleteEmployeeById("E002");
        if (deleted) {
            System.out.println("Employee deleted.");
        } else {
            System.out.println("Employee not found.");
        }

        // Traversing employees after deletion
        System.out.println("\nAll Employees after deletion:");
        manager.traverseEmployees();
    }
}
