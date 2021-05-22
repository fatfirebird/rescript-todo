open Styles.SComponents

@genType
type todo = {
  text: string,
  id: int,
}

@genType @react.component
let make = (~handleRemoveTodo, ~id, ~text, ~handleEditTodo) => {
  let (newTodoText, setNewTodoText) = React.useState(_ => "")
  let (isEditing, setIsEditing) = React.useState(_ => false)

  <div className={todoContainerStyles()}>
    {isEditing
      ? <input
          className={todoTextStyles()}
          defaultValue={text}
          onChange={e => {
            let value = ReactEvent.Form.target(e)["value"]
            setNewTodoText(value)
          }}
        />
      : <div className={todoTextStyles()}> {React.string(text)} </div>}
    <button onClick={_ => handleRemoveTodo(id)} className={buttonStyles("delete")}>
      {React.string("X")}
    </button>
    {isEditing
      ? <button
          className={buttonStyles("add")}
          onClick={_ => {
            handleEditTodo({id: id, text: newTodoText})
            setIsEditing(_ => false)
          }}>
          {React.string("save")}
        </button>
      : <button className={buttonStyles("add")} onClick={_ => setIsEditing(_ => true)}>
          {React.string("edit")}
        </button>}
  </div>
}
