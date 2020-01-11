<?php

namespace App\Http\Middleware;

use Closure;

class AllowOriginMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        return $next($request)->header('Access-Control-Allow-Origin', 'http://localhost:9527')
            ->header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, PUT, DELETE')
            ->header('Access-Control-Allow-Headers', 'Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN')
            ->header('Access-Control-Expose-Headers', 'Authorization, authenticated')
            ->header('Access-Control-Allow-Credentials', 'true');
//        $response = $next($request);
//        $origin = $request->server('SERVER_NAME') ? $request->server('SERVER_NAME') : '';
//        $allow_origin = [
//            'localhost',
//            'blog.inectu.com'
//        ];
//        if (in_array($origin, $allow_origin)) {
//            $response->headers->add('Access-Control-Allow-Origin', $origin);
//            $response->headers->add('Access-Control-Allow-Headers', 'Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN');
//            $response->headers->add('Access-Control-Expose-Headers', 'Authorization, authenticated');
//            $response->headers->add('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, OPTIONS');
//            $response->headers->add('Access-Control-Allow-Credentials', 'true');
//        }
        return $response;
    }
}
