pragma solidity ^0.5.0;

contract TodoList {
  // ToDoリスト内のタスク数を追跡する
  uint public taskCount = 0;

  // タスクをモデル化
  struct Task {
    uint id;// データベースレコードのようなもの
    string content;// テキストの文字列
    bool completed;// チェックボックスステータス
  }

  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );

  constructor() public {
    createTask('Check out Task');
  }

  mapping(uint => Task) public tasks;// ストレージに格納

  function createTask(string memory _content) public {
    taskCount++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);
  }

  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }
}