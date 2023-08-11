defmodule Todo do
  def start do
    loop([])
  end

  defp loop(tasks) do
    IO.puts("\e[33m=== Minha Lista de Tarefas ===\e[0m")
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
        IO.puts("\e[32mTarefa adicionada!\e[0m")
        loop(tasks)

      "2" ->
        if Enum.empty?(tasks) do
          IO.puts("Não há tarefa cadastrada.")
        else
          IO.puts("\e[34m=== Tarefas ===\e[0m")

          Enum.with_index(tasks)
          |> Enum.each(fn {task, index} ->
            IO.puts("\e[34m#{index + 1}. #{task}\e[0m")
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
            IO.puts("\e[41mNúmero de tarefa inválido.\e[0m")
          else
            new_tasks = List.delete_at(tasks, task_index - 1)
            IO.puts("\e[32mTarefa removida!\e[0m")
            loop(new_tasks)
          end
        end

      "4" ->
        IO.puts("Saindo...")
        tasks

      _ ->
        IO.puts("\e[41mOpção inválida! Escolha novamente.\e[0m")
        loop(tasks)
    end
  end
end

Todo.start()
