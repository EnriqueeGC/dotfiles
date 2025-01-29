const arto = {
    name: 'Arto Hellas',
    age: 35,
    education: 'PhD',
    greet: function() {
        console.log(`Hello, my nname is ${this.name}`);
    }
};

console.log(arto);
arto.greet();

arto.growOlder = function () {
    this.age += 1
};

console.log(arto);

console.log(arto.age);
arto.growOlder();
console.log(arto.age);

const arto2 = {
    name: 'Arto Hellas',
    age: 35,
    education: 'PhD',
    greet: function () {
        console.log(`Hello, my name is ${this.name}`);
    },
    doAddition: function (a, b) {
        console.log(a+b);
    },
};

arto2.doAddition(1, 4);

const referenceToAddition = arto2.doAddition; // Refers to arto2 function
referenceToAddition(10, 15); 

const arto3 = {
    name: 'Arto Hellas',
    greet: function () {
        console.log(`Hello my name is ${this.name}`);
    },
};

setTimeout(arto3.greet, 6000);

/* 
    Calling arto.greet.bind(arto) creates a new function where this is bopound to point to Arto independent of where and how the method is being called.
*/
setTimeout(arto3.greet.bind(arto), 1000); // the original function is preserved

