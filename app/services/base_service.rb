# frozen_string_literal: true

class BaseService
  class << self
    def perform(*args, **opts)
      new_service = opts.empty? ? new(*args) : new(*args, **opts)
      new_service.tap(&:perform)
    end
  end

  def success?
    !@_failure
  end

  def failure?
    !success?
  end

  # Return the first error from the stack
  #
  # @return [String]
  def error
    errors.first
  end

  # Return the collection of errors
  #
  # @return [Array]
  def errors
    @_errors ||= []
    @_errors.dup
  end

  # Set service status to failure. Optionally allow error message to be
  # set for the service.
  # @param error [String] The error message
  #
  # @return [self]
  def fail!(error = nil)
    add_error(error)
    @_failure = true

    self
  end

  private

  # @todo @_errors should be set on a result object within the Service
  #       this will negate the need to memoize it both here and above within #error
  def add_error(error)
    @_errors ||= []
    @_errors << error
  end
end
