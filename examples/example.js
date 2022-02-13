function add(a, b) {
	return a + b;
}

class Rectangle {
	constructor(width, height) {
		this.width = width;
		this.height = height;
	}

	print() {
		console.log("width: " + this.width + " height: " + this.height + "\n");
	}
}

rectangle = new Rectangle(10, 10);
const added = add(rectangle.width, rectangle.height);

console.log(added);
rectangle.print();

for (let i = 0; i < 100; i++) {
	console.log(i);
	switch (i) {
		case 1:
			console.log("one");
			break;
		case 2:
			console.log("two");
			break;
		default:
			console.log("number");
	}

	if (i % 2 === 1) {
		console.log("odd");
	} else {
		console.log("even");
	}
}
