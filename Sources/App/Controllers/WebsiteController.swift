import Vapor

struct WebsiteController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: indexHandler)
        routes.get("robots.txt", use: robotsTxtHandler)
    }

    func indexHandler(_ req: Request) -> Response {
        return req.redirect(to: "/index.html", redirectType: .temporary)
    }

    func robotsTxtHandler(_ req: Request) -> String {
        return "User-agent: *\nDisallow: /"
    }
}
