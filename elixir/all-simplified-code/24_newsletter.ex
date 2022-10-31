# Concept: File

defmodule Newsletter do
  def read_emails(path), do: File.read!(path) |> String.split("\n", trim: true)

  def open_log(path), do: File.open!(path, [:write])

  def log_sent_email(pid, email), do: IO.puts(pid, email)

  def close_log(pid), do: File.close(pid)

  def send_newsletter(emails_path, log_path, send_fun) do
    write_pid = open_log(log_path)

    Enum.map(read_emails(emails_path), fn email ->
      case send_fun.(email) do
        :ok -> log_sent_email(write_pid, email)
        :error -> nil
      end
    end)

    close_log(write_pid)
  end
end
