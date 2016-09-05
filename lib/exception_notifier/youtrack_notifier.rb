require 'youtrack'

module ExceptionNotifier
  class YoutrackNotifier
    attr_accessor :client, :project

      def initialize(options)
        @project = options[:project]

        @client = Youtrack::Client.new do |c|
          c.url = options[:url]
          c.login = options[:user]
          c.password = options[:password]
        end

        @client.connect!
      end

      def call(exception, options={})
        issue_resource = @client.issues

        backtrace = enrich_message_with_backtrace(exception)

        issue = {
          project: @project,
          summary: exception.message,
          description: backtrace,
          type: 'bug',
          priority: 'critical',
          state: 'open'
        }

        issue_resource.create(issue)
      end

      def enrich_message_with_backtrace(exception)
        backtrace = clean_backtrace(exception).first(10).join("\n")
        ['*Backtrace:*', backtrace].join("\n")
      end

      def clean_backtrace(exception)
        if defined?(Rails) && Rails.respond_to?(:backtrace_cleaner)
          Rails.backtrace_cleaner.send(:filter, exception.backtrace)
        else
          exception.backtrace
        end
      end
  end
end
