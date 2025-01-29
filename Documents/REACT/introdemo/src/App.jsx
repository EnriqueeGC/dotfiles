const Hello = (hola) => {
  console.log(hola)
  for (let clave in hola) {
    console.log(clave, hola[clave])
  }
  return (
    <>
      <p>Hello {hola.name}, you are {hola.age} years old.</p>
      {/*  <p> */}
      <ul>
        {Object.entries(hola).map(([clave, valor]) => (
          <li key={clave}>
            <strong>{clave}:</strong> {valor}
          </li>
        ))}
      </ul>
      {/*   </p> */}
    </>
  )
}

const App = () => {
  const now = new Date();
  const a = 10;
  const b = 20
  const name = 'Luis'
  const age = 32
  console.log(now, a + b)

  return (
    <>
      <p>Hello World, it is <br />{now.toString()}</p>
      <p>
        {a} + {b} = {a + b}
      </p>
      <Hello name='Edgar' age={12 + 10} />
      <Hello name={name} age={age} />
    </>
  )
}

export default App
