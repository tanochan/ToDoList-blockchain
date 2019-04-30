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

  constructor() public {
    createTask('Check out Task');
  }

  mapping(uint => Task) public tasks;// ストレージに格納

  function createTask(string memory _content) public {
    taskCount++;
    tasks[taskCount] = Task(taskCount, _content, false);
  }
}