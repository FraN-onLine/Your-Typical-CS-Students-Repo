<?php
$conn = new mysqli("localhost", "root", "root", "todo_app");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["add_task"])) {
    $name = $_POST["name"];
    $stmt = $conn->prepare("INSERT INTO tasks (taskname) VALUES (?)");
    $stmt->bind_param("s", $name);
    $stmt->execute();
    $stmt->close();
}

if (isset($_GET['toggle'])) {
    $id = (int)$_GET['toggle'];
    $conn->query("UPDATE tasks SET taskstatus = NOT taskstatus WHERE id = $id");
    header("Location: index.php");
    exit;
}

if (isset($_GET['delete'])) {
    $id = (int)$_GET['delete'];
    $conn->query("DELETE FROM tasks WHERE id = $id");
    header("Location: index.php");
    exit;
}

$result = $conn->query("SELECT * FROM tasks ORDER BY id DESC");
$tasks = [];
while ($row = $result->fetch_assoc()) {
    $tasks[] = $row;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>To-Do List</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        input, button { padding: 5px; margin: 5px; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 5px; text-align: center; }
        .notdone { background-color: #f8d7da; }
        .done { background-color: #d4edda; }
    </style>
</head>
<body>
    <div style="justify-content: center; text-align: center; margin-bottom: 2rem;">
    <h1><span style="color: rgb(223, 192, 109)"> TO-DO </span> LIST</h1>
    <h5> Ano kaya gagawin ko ngayon?</h5>

    <form method="POST">
        <input type="text" name="name" placeholder="Enter Task" required>
        <button type="submit" name="add_task">Add Task</button>
    </form>
    </div>

   
    <div style="padding-left: 5rem; padding-right: 5rem;">
    <h2>Tasks</h2>
    <table>
        <tr>
            <th>Tasks</th>
            <th>Status</th>
            <th style="color: red;">Delete?</th>
        </tr>
        <?php foreach ($tasks as $task): ?>
            <tr class="<?= $task['taskstatus'] ? 'done' : 'notdone' ?>">
                <td>
                <?php if ($task['taskstatus']){ ?>
                <?= htmlspecialchars($task['taskname']) ?>
                <?php } else { ?>
                <s> <?=htmlspecialchars($task['taskname']) ?> </s>
                <?php } ?>
                </td>

                <td>
                <?php if ($task['taskstatus']){ ?>
                <a href="?toggle=<?= $task['id'] ?>">Mark as Done</a>
                <?php } else { ?>
                <p> done </p>
                <?php } ?>
                </td>

                <td>
                <a href="?delete=<?= $task['id'] ?>" onclick="return confirm('Are you sure you want to delete this task?');">Delete</a>
               </td>
            </tr>
        <?php endforeach; ?>
    </table>
    </div>

</body>
</html>
