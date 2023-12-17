<?php
define('LOG_LEVEL', LOG_DEBUG);

class Log
{
    public function write($priority, $message)
    {
        if( LOG_LEVEL >= $priority )
        {
            $bt       = debug_backtrace();
            $file     = $bt[0]['file'];
            $line     = $bt[0]['line'];

            $priorities = [
                LOG_EMERG   => 'EMERG',
                LOG_ALERT   => 'ALERT',
                LOG_CRIT    => 'CRITICAL',
                LOG_ERR     => 'ERROR',
                LOG_WARNING => 'WARNING',
                LOG_NOTICE  => 'NOTICE',
                LOG_INFO    => 'INFO',
                LOG_DEBUG   => 'DEBUG'
            ];

            // for datadog
            $context = \DDTrace\current_context();
            $append = sprintf(
                ' [dd.trace_id=%s dd.span_id=%s]',
                \DDTrace\logs_correlation_trace_id(),
                dd_trace_peek_span_id()
            );

            $str = sprintf('% -8s : %s[%d] : %s (sid:%s)', $priorities[$priority], $file, $line, $message, substr(session_id(), 0, 12) );
            $str .= $append;
            error_log($str, 0);
        }
    }
}


$log = new Log();
$log->write(LOG_DEBUG, "hello datadog");

?>
