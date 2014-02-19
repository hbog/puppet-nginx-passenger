class nginx_passenger::params {
  $nx_proxy_redirect = off
  $nx_proxy_set_header = [
    'Host $host',
    'X-Real-IP $remote_addr',
    'X-Forwarded-For $proxy_add_x_forwarded_for',
  ]
  $nx_proxy_cache_path = false
  $nx_proxy_cache_levels = 1
  $nx_proxy_cache_keys_zone = 'd2:100m'
  $nx_proxy_cache_max_size = '500m'
  $nx_proxy_cache_inactive = '20m'

  $nx_client_body_temp_path = "${nx_run_dir}/client_body_temp"
  $nx_client_body_buffer_size = '128k'
  $nx_client_max_body_size = '10m'
  $nx_proxy_temp_path = "${nx_run_dir}/proxy_temp"
  $nx_proxy_connect_timeout = '90'
  $nx_proxy_send_timeout = '90'
  $nx_proxy_read_timeout = '90'
  $nx_proxy_buffers = '32 4k'
  $nx_proxy_http_version = '1.0'
  $nx_proxy_buffer_size = '8k'
}