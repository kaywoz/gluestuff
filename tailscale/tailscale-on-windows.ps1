winget install tailscale.tailscale
tailscale up --force-reauth --advertise-tags=tag:endpoint-trusted
tailscale set --auto-update