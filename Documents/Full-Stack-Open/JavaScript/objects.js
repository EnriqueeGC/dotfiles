const object1 = {
    name: 'Edgar',
    age: 22,
    education: 'UMG'
};

console.log(object1);

const sales = 'Toyota';

function carTypes(name) {
    return name === 'Honda' ? name : `sorry, we don't sell ${name}.`;
}

const car = {
    myCar: 'Saturn',
    getCar: carTypes('Honda'),
    special: sales
};

console.log(car.myCar);
console.log(car.getCar);
console.log(car.special);

const car2 = { 
    manyCars: {a: 'Saab', b: 'Jeep'}, 
    a: 'Mazda'
};

console.log(car2.manyCars.a);
console.log(car2['a']);

const object3 = { 
    name: {
        first: 'Leo',
        last: 'Messi'
    },
    grades: [2, 3, 5, 3],
    department: 'Stanford University',
};

const grades = 'grades';

console.log(object3);
console.log(object3.name.first);
console.log(object3[grades]);

// Add properties
console.log(object3);
object3.department = 'I dont know';
object3['secretNumber'] = 3;
console.log(object3);

const people = [
    {name: 'Ana', age:22},
    {name: 'Luis', age:35}
]

const agePlus1 = people.map(person => ({
    ...person,
    age: person.age + 1
}));

console.log(people);
console.log(agePlus1);

let user = new Object();
// console.log(typeof(user));
console.log(user);

user = [
    {name:'Edgar', age:22}
];

console.log(user);
// 
user[0].isAdmin = true;
console.log(user[0]);

delete user[0].isAdmin;
console.log(user[0]);
