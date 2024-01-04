CREATE DEFINER=`root`@`localhost` PROCEDURE `limpa_pedidos`()
BEGIN
	DELETE FROM pedidos WHERE pago = 'Não';
END