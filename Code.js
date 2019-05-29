class Node {
  constructor(data, leftNode = null, rightNode = null) {
    this.data = data;
    this.left = leftNode;
    this.right = rightNode;
  }
}

class BinaryTree {
  constructor() {
    this.root = null;
    this.count=0;
  }

  insert(data, current = this.root) {
    if (!this.root) {
      this.root = new Node(data);
      return;
    }
    if (current.data > data) {
      if (current.left === null) {
        current.left = new Node(data);
        this.count++;
      } else {
      this.insert(data, current.left);
      }
    }
    if (current.data < data) {
      if (current.right === null) {
        current.right = new Node(data);
        this.count++;
      } else {
      this.insert(data, current.right);
      }
    }
  }
  
  delete(data, current = this.root) {
    if (current.data > data){}
    if (current.data < data){}
  }
}
