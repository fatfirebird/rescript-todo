type todo = {
  text: string,
  id: int,
}

@react.component
let make = (~handleRemoveTodo, ~id, ~text, ~handleEditTodo) => {
  let (newTodoText, setNewTodoText) = React.useState(_ => "")
  let (isEditing, setIsEditing) = React.useState(_ => false)

  <div className={Styles.todoContainerStyles()}>
    {isEditing
      ? <input
          className={Styles.todoTextStyles()}
          defaultValue={text}
          onChange={e => {
            let value = ReactEvent.Form.target(e)["value"]
            setNewTodoText(value)
          }}
        />
      : <div className={Styles.todoTextStyles()}> {React.string(text)} </div>}
    <button onClick={_ => handleRemoveTodo(id)} className={Styles.buttonStyles("delete")}>
      {React.string("X")}
    </button>
    {isEditing
      ? <button
          className={Styles.buttonStyles("add")}
          onClick={_ => {
            handleEditTodo({id: id, text: newTodoText})
            setIsEditing(_ => false)
          }}>
          {React.string("save")}
        </button>
      : <button className={Styles.buttonStyles("add")} onClick={_ => setIsEditing(_ => true)}>
          {React.string("edit")}
        </button>}
  </div>
}
