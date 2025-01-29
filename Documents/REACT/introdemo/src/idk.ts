const App = () => {
    const now = new Date()
    const a = 10
    const b = 20
    return React.createElement(
      'div',
      null,
      React.createElement(
        'p', null, 'Hello world, it is ', now.toString()
      ),
      React.createElement(
        'p', null, a, ' plus ', b, ' is ', a + b
      )
    )
  }