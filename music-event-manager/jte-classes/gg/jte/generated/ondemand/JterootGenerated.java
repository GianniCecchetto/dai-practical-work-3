package gg.jte.generated.ondemand;
@SuppressWarnings("unchecked")
public final class JterootGenerated {
	public static final String JTE_NAME = "root.jte";
	public static final int[] JTE_LINE_INFO = {1,1,1,1,1,1,1,1,1,1,1,1};
	public static void render(gg.jte.html.HtmlTemplateOutput jteOutput, gg.jte.html.HtmlInterceptor jteHtmlInterceptor) {
		jteOutput.writeContent("Hello jte!\r\n<a href=\"/moi\">Moi</a>");
	}
	public static void renderMap(gg.jte.html.HtmlTemplateOutput jteOutput, gg.jte.html.HtmlInterceptor jteHtmlInterceptor, java.util.Map<String, Object> params) {
		render(jteOutput, jteHtmlInterceptor);
	}
}
