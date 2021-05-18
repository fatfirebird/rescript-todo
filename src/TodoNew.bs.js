// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Styles$TestPresentationApp from "./Styles.bs.js";

function TodoNew(Props) {
  var handleAddTodo = Props.handleAddTodo;
  var match = React.useState(function () {
        return "";
      });
  var setTodoText = match[1];
  var todoText = match[0];
  return React.createElement("div", undefined, React.createElement("input", {
                  value: todoText,
                  onChange: (function (e) {
                      return Curry._1(setTodoText, e.target.value);
                    })
                }), todoText.length > 0 ? React.createElement("button", {
                    className: Styles$TestPresentationApp.buttonStyles("add"),
                    onClick: (function (param) {
                        Curry._1(handleAddTodo, todoText);
                        return Curry._1(setTodoText, (function (param) {
                                      return "";
                                    }));
                      })
                  }, "add todo") : null);
}

var make = TodoNew;

export {
  make ,
  
}
/* react Not a pure module */
