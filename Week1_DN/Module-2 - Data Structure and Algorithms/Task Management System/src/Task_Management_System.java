import java.util.*;
public class Task_Management_System{
    public static void main(String[] args) {
        TaskLinkedList taskList = new TaskLinkedList();

        // Adding tasks
        taskList.addTask(new Task("T001", "Design Database", "In Progress"));
        taskList.addTask(new Task("T002", "Develop API", "Pending"));
        taskList.addTask(new Task("T003", "Test Application", "Completed"));

        // Traversing tasks
        System.out.println("All Tasks:");
        taskList.traverseTasks();

        // Searching for a task
        System.out.println("\nSearching for task with ID T002:");
        Task task = taskList.searchTaskById("T002");
        if (task != null) {
            System.out.println(task);
        } else {
            System.out.println("Task not found.");
        }

        // Deleting a task
        System.out.println("\nDeleting task with ID T002:");
        boolean deleted = taskList.deleteTaskById("T002");
        if (deleted) {
            System.out.println("Task deleted.");
        } else {
            System.out.println("Task not found.");
        }

        // Traversing tasks after deletion
        System.out.println("\nAll Tasks after deletion:");
        taskList.traverseTasks();
    }
}
