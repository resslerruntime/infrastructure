resource "aws_eip" "ip" {
  count = "${var.static_nodes}"
}

resource "aws_eip_association" "ip_associate" {
  count         = "${var.static_nodes}"
  instance_id   = "${aws_instance.static_node.*.id[count.index]}"
  allocation_id = "${aws_eip.ip.*.id[count.index]}"
}
