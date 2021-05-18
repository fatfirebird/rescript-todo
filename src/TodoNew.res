@react.component
let make = (~handleAddTodo) => {
  let (todoText, setTodoText) = React.useState(_ => "")

  <div>
    <input
      onChange={e => {
        let value = ReactEvent.Form.target(e)["value"]
        setTodoText(value)
      }}
      value={todoText}
    />
    {Js.String.length(todoText) > 0
      ? <button
          className={Styles.buttonStyles("add")}
          onClick={_ => {
            handleAddTodo(todoText)
            setTodoText(_ => "")
          }}>
          {React.string("add todo")}
        </button>
      : React.null}
  </div>
}
