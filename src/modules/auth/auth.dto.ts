// DTO para registro
export interface RegisterDTO {
  nombre: string;
  email: string;
  password: string;
  rolId: number; // 1 = admin | 2 = vendedor
}

export interface LoginDTO {
  email: string;
  password: string;
}
