# frozen_string_literal: true

module Asaas
  # AsaasError is the base error from which all other more specific Asaas
  # errors derive.
  class AsaasError < StandardError
    attr_reader :message, :code, :error, :http_body, :http_headers, :http_status, :json_body, :request_id

    # Response contains a AsaasResponse object that has some basic information
    # about the response that conveyed the error.
    attr_accessor :response # equivalent to #data

    # Initializes a AsaasError.
    def initialize(message = nil, http_status: nil, http_body: nil, # rubocop:todo Lint/MissingSuper
                   json_body: nil, http_headers: nil, code: nil)
      @message = message
      @http_status = http_status
      @http_body = http_body
      @http_headers = http_headers || {}
      @idempotent_replayed = @http_headers["idempotent-replayed"] == "true"
      @json_body = json_body
      @code = code
      @request_id = @http_headers["request-id"]
      @error = construct_error_object
    end

    def construct_error_object
      return nil if @json_body.nil? || !@json_body.key?(:error)

      ErrorObject.construct_from(@json_body[:error])
    end

    # Whether the error was the result of an idempotent replay, meaning that it
    # originally occurred on a previous request and is being replayed back
    # because the user sent the same idempotency key for this one.
    def idempotent_replayed?
      @idempotent_replayed
    end

    def to_s
      status_string = @http_status.nil? ? "" : "(Status #{@http_status}) "
      id_string = @request_id.nil? ? "" : "(Request #{@request_id}) "
      "#{status_string}#{id_string}#{@message}"
    end
  end

  # AuthenticationError is raised when invalid credentials are used to connect
  # to Asaas's servers.
  class AuthenticationError < AsaasError
  end

  # APIConnectionError is raised in the event that the SDK can't connect to
  # Asaas's servers. That can be for a variety of different reasons from a
  # downed network to a bad TLS certificate.
  class APIConnectionError < AsaasError
  end

  # APIError is a generic error that may be raised in cases where none of the
  # other named errors cover the problem. It could also be raised in the case
  # that a new error has been introduced in the API, but this version of the
  # Ruby SDK doesn't know how to handle it.
  class APIError < AsaasError
  end

  # CardError is raised when a user enters a card that can't be charged for
  # some reason.
  class CardError < AsaasError
    attr_reader :param

    def initialize(message, param, code: nil, http_status: nil, http_body: nil,
                   json_body: nil, http_headers: nil)
      super(message, http_status: http_status, http_body: http_body,
                     json_body: json_body, http_headers: http_headers,
                     code: code)
      @param = param
    end
  end

  # IdempotencyError is raised in cases where an idempotency key was used
  # improperly.
  class IdempotencyError < AsaasError
  end

  # InvalidRequestError is raised when a request is initiated with invalid
  # parameters.
  class InvalidRequestError < AsaasError
    attr_accessor :param

    def initialize(message, param, http_status: nil, http_body: nil,
                   json_body: nil, http_headers: nil, code: nil)
      super(message, http_status: http_status, http_body: http_body,
                     json_body: json_body, http_headers: http_headers,
                     code: code)
      @param = param
    end
  end

  # PermissionError is raised in cases where access was attempted on a resource
  # that wasn't allowed.
  class PermissionError < AsaasError
  end

  # RateLimitError is raised in cases where an account is putting too much load
  # on Asaas's API servers (usually by performing too many requests). Please
  # back off on request rate.
  class RateLimitError < AsaasError
  end

  # SignatureVerificationError is raised when the signature verification for a
  # webhook fails
  class SignatureVerificationError < AsaasError
    attr_accessor :sig_header

    def initialize(message, sig_header, http_body: nil)
      super(message, http_body: http_body)
      @sig_header = sig_header
    end
  end
end
