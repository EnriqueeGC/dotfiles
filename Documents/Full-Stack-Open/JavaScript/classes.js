class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    };
    greet() {
        console.log(`Hello, my name is ${this.name}`);
    };
};

console.log(Person);

const adam = new Person('Adam Ondra', 29);
adam.greet();