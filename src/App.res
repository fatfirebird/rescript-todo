open Todo.Item

@send external filter: (array<'a>, 'a => bool) => array<'a> = "filter"
@send external concat: (Js.Array.t<'a>, Js.Array.t<'a>) => Js.Array.t<'a> = "concat"
@send external map: (array<'a>, 'a => 'b) => array<'b> = "map"

@genType
type action = Add(string) | Remove(int) | Edit(todo)

@genType
type state = {todos: array<todo>}

@genType
let reducer = (state, action) => {
  switch action {
  | Add(text) => {
      let curLength = Js.Array.length(state.todos)
      let id = curLength == 0 ? 1 : state.todos[Js.Array.length(state.todos) - 1].id + 1

      {
        todos: state.todos->concat([{id: id, text: text}]),
      }
    }
  | Remove(id) => {
      todos: state.todos->filter(todo => todo.id !== id),
    }
  | Edit(newTodo) => {
      let newTodoList = state.todos->map(todo => todo.id == newTodo.id ? newTodo : todo)

      {todos: newTodoList}
    }
  }
}

@genType
let initialState = {todos: [{id: 1, text: "jjj"}]}

@genType @react.component
let make = () => {
  let (state, dispatch) = React.useReducer(reducer, initialState)

  let handleRemoveTodo = id => id->Remove->dispatch

  let handleAddTodo = todo => todo->Add->dispatch

  let handleEditTodo = todo => todo->Edit->dispatch

  let todoList = state.todos->map(({id, text}) => {
    <Todo.Item
      handleRemoveTodo={handleRemoveTodo}
      key={Belt.Int.toString(id)}
      id={id}
      text={text}
      handleEditTodo={handleEditTodo}
    />
  })

  <div className="App">
    <div
      style={ReactDOMStyle.make(
        ~width="100%",
        ~display="flex",
        ~flexDirection="column",
        ~alignItems="center",
        (),
      )}>
      {React.array(todoList)}
    </div>
    <Todo.New handleAddTodo={handleAddTodo} />
  </div>
}
