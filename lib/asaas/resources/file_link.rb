# frozen_string_literal: true

module Asaas
  # To share the contents of a `File` object with non-Asaas users, you can
  # create a `FileLink`. `FileLink`s contain a URL that you can use to
  # retrieve the contents of the file without authentication.
  class FileLink < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "file_link"
  end
end
