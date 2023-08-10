defmodule Todo do
  def start do
    loop([])
  end

  defp loop(tasks) do
    IO.puts("=== Minha Lista de Tarefas ===")
    IO.puts("1. Adicionar Tarefa")
    IO.puts("2. Mostrar Tarefas")
    IO.puts("3. Remover Tarefa")
    IO.puts("4. Sair")
    IO.write("Escolha uma opção: ")

    choice = IO.gets("") |> String.trim()

    case choice do
      "1" ->
        IO.write("Digite a tarefa: ")
        task = IO.gets("") |> String.trim()
        tasks = tasks ++ [task]
        IO.puts("Tarefa adicionada!")
        loop(tasks)

      "2" ->
        if Enum.empty?(tasks) do
          IO.puts("Não há tarefa cadastrada.")
        else
          IO.puts("=== Tarefas ===")

          Enum.with_index(tasks)
          |> Enum.each(fn {task, index} ->
            IO.puts("#{index + 1}. #{task}")
          end)
        end

        loop(tasks)

      "3" ->
        if Enum.empty?(tasks) do
          IO.puts("Não há tarefa cadastrada.")
        else
          IO.write("Digite o número da tarefa a ser removida: ")
          task_index = IO.gets("") |> String.trim() |> String.to_integer()

          if task_index < 1 or task_index > length(tasks) do
            IO.puts("Número de tarefa inválido.")
          else
            new_tasks = List.delete_at(tasks, task_index - 1)
            IO.puts("Tarefa removida!")
            loop(new_tasks)
          end
        end

      "4" ->
        IO.puts("Saindo...")
        tasks

      _ ->
        IO.puts("Opção inválida! Escolha novamente.")
        loop(tasks)
    end
  end
end

Todo.start()
